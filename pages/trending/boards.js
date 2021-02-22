import TrendingBoardsRes from "src/PageTrendingBoards.js";

// This can be re-exported as is (no Fast-Refresh issues)
export { getServerSideProps } from "src/PageTrendingBoards.js";

// Note:
// We need to wrap the make call with
// a Fast-Refresh conform function name,
// (in this case, uppercased first letter)
//
// If you don't do this, your Fast-Refresh will
// not work!
export default function TrendingBoards(props) {
  return <TrendingBoardsRes {...props}/>;
}
