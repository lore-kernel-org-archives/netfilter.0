From: xiong.xiaochun%ZTE_LTD@zte.com.cn
Subject: can not install iptables-1.2.7a to 2.4.18 kernel successfully ?
Date: Tue, 15 Oct 2002 09:25:31 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFDB5E2B55.4E27625B-ON48256C53.00035BB2@zte.com.cn>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

  I am trying to apply iptables-1.2.7a to Red Hat 7.3 /2.4.18 kernel;

the first ,i download patch-o-matic-20020825.tar.bz2 and install the patch,

i read the README file and do as follows:
                                                                            
                                                                            
   1) # ./runme pending ;                                                   
   2) # ./runme extra   ;                                                   
                                                                            
   in these steps i seleted almost all the patchs to be install ,           
   but the true is the two steps have some same patchs and the are  break   
   each                                                                     
   other ;                                                                  
                                                                            
   after these,i begin to install iptables-1.2.7a as follows:               
   3) # make KERNEL_DIR=/usr/src/linux                                      
   4) # make install KERNEL_DIR=/usr/src/linux                              
   5) # make install-devel                                                  
                                                                            
   6) # make menuconfig                                                     
      i selected almost all the modules i can select about Netfilter        
   options;                                                                 
   go to my kernel dir to make new kernel                                   
                                                                            
   7) # make dep  clean bzImage modules modules_install install             
                                                                            
   8) edit the grub  menu.lst ,copy bzImage                                 
                                                                            
   after reboot the system ,i input :                                       
                                                                            
    9) # modproe ipt_string ;                                               
    no prompt ;                                                             
    10) # lsmod                                                             
    11) i can see ipt_string ;                                              
                                                                            
    12) # iptabes -m string --help ;                                        
                                                                            
   the prompt is as follow:                                                 
                                                                            
   iptables v1.2.7a: Couldn't load match                                    
   `string':/usr/local/lib/iptables/libipt_string.so: cannot open           
    shared object file: No such file or directory                           
   Try `iptables -h' or 'iptables --help' for more information.             
                                                                            
                                                                            
   why?                                                                     
   i can see the string module when i make menuconfig and truely i have     
   selected it ;                                                            
   but the truly there are no libipt_string.so in dir                       
   /usr/local/lib/iptables/ ,                                               
   what's wrong ?                                                           
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            




