import { Navigate } from "react-router-dom";
import { LoginForm } from "../../components/Fragments/Auth/LoginForm";
import { useToken } from "../../context/TokenContext";
import AuthLayout from "../../components/Layouts/AuthLayout";

export const LoginPage = () => {
  console.log("Token:", token);
  const { token } = useToken();
  console.log("Current Path:", window.location.pathname);
  if (token) return <Navigate to="/dashboard" />;
  return (
    <AuthLayout header="Aplikasi Divisi ITS">
      <LoginForm />
    </AuthLayout>
  );
};
