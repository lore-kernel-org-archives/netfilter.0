From: Jason White <jdw-netfilter@jdwhite.org>
Subject: Forcing source port with NAT
Date: Mon, 23 Jun 2003 15:02:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030623200247.GB28900@jdwhite.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Greetings,                                                                      
  I have an application, Zephyr Messaging Service, which uses a client          
application that sends out UDP packets on port 2104.  The Zephyr server         
will refuse packets from the client if the source address is not 2104.          
I want to run this application behind a NAT on one given machine.  I            
need a way to ensure that packets from this one machine with a source           
address of 2104 go through the NAT that they emerge on port 2104 of the         
external ip address.  To diagram a packet:                                      
                                                                                
[Intenal machine-10.0.0.2:2104] --> [NAT internal: 10.0.0.1] -->                
  [NAT external: 200.200.200.200: 2104] --> ///internet/// ...                  
                                                                                
Basically, I need to ensure that anything coming in on 200.200.200.200:2104     
goes to 10.0.0.2:2104 and anything going out from 10.0.0.2:2104 goes out        
200.200.200.200:2104.                                                           

I know how to map the external to internal, but internal to external            
isn't immediately obvious                                                       
                                                                                
Thanks,                                                                         
-Jason        

-- 
Jason White (jdw-netfilter@jdwhite.org)  http://www.jdwhite.org/~jdwhite
Jabber:jdwhite@jabber.org  IRC:irc.netbsd.org/{jdwhite,jdw}
AIM:jdwhite90125  Yahoo:jdwhite89  ICQ:9295078  MSN:jdwhite89@hotmail.com
GPG KeyID: 0x74CF850D/1F57 465A 1357 BA39 2BEF  5629 6E1C 2B20 74CF 850D

