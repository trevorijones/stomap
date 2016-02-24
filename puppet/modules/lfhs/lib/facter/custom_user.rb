#custom_user.rb
 
Facter.add('userhome') do 
  setcode do
    Facter::Core::Execution.exec('echo $HOME')
  end
end
