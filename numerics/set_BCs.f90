    SUBROUTINE set_BCs()
       ! set_BCs ----------------------------------------------------------
       !
       ! This subroutine enforces the periodic boundary conditions in the
       ! x and y directions (already taken care of in the z direction by the
       ! ghost cells).
       !
       ! ------------------------------------------------------------------
       IMPLICIT NONE
       
       ! density
       rho%field(1,:,:) = rho%field(Xnum-1,:,:) ! bottom x boundary
       rho%field(Xnum,:,:) = rho%field(2,:,:) ! top x boundary
       rho%field(:,1,:) = rho%field(:,Ynum-1,:) ! bottom y boundary
       rho%field(:,Ynum,:) = rho%field(:,2,:) ! top y boundary
       
       ! momentum
       rho_u%field(1,:,:,:) = rho_u%field(Xnum-1,:,:,:) ! bottom x boundary
       rho_u%field(Xnum,:,:,:) = rho_u%field(2,:,:,:) ! top x boundary
       rho_u%field(:,1,:,:) = rho_u%field(:,Ynum-1,:,:) ! bottom y boundary
       rho_u%field(:,Ynum,:,:) = rho_u%field(:,2,:,:) ! top y boundary
       
       ! energy
       E%field(1,:,:) = E%field(Xnum-1,:,:) ! bottom x boundary
       E%field(Xnum,:,:) = E%field(2,:,:) ! top x boundary
       E%field(:,1,:) = E%field(:,Ynum-1,:) ! bottom y boundary
       E%field(:,Ynum,:) = E%field(:,2,:) ! top y boundary
       
    END SUBROUTINE set_BCs
    
    