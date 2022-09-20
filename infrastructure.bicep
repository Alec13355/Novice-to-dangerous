param env string = 'fooDev'
param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'resourceGroup().name + "appServicePlan-" + env'
  location: location
  sku: {
    name: 'F1'
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: 'resourceGroup().name + "appService" + env'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}
