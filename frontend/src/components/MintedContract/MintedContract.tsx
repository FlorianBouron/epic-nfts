export default function MintedContract({numberOfContract}: {numberOfContract: number}) {
  if(numberOfContract===-1) {
    return null;
  }
  return (
    <p className="text">
      Already {numberOfContract} have been minted out of 50
    </p>
  )
}
