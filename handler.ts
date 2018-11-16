import { APIGatewayEvent, Callback } from 'aws-lambda'

export const graphql = (
  event: APIGatewayEvent,
  _: any,
  callback: Callback
): void => {
  callback(null, event)
}
