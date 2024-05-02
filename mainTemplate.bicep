param location string = resourceGroup().location

@description('Storage account name prefix.')
@maxLength(11)
param storageAccountNamePrefix string

var storageAccountName = '${storageAccountNamePrefix}${uniqueString(resourceGroup().id)}'

@description('Storage account type allowed values')
@allowed([
  'Premium_LRS'
  'Standard_LRS'
  'Standard_GRS'
])
param storageAccountType string

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
