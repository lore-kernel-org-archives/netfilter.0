From: "David Culp" <dculp@mcleodhealth.org>
Subject: RE: Help - Public Interface seems to go to sleep
Date: Wed, 16 Apr 2003 23:02:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <85256D0B.0010B0F3.00@nt_domino.mrmc.mcleodhealth.org>
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
To: Rowan Reid <rreid@studio3arc.com>, netfilter@lists.netfilter.org



How did you remove the APM from your kernel to help with the power management of
the 2nd NIC ?

  Thanks,
David








Rowan Reid <rreid@studio3arc.com> on 04/15/2003 06:14:07 PM
                                                                                
                                                                                
                                                                                


                                                              
                                                              
                                                              
 To:      David Culp/MRMC/McLeod_Health@McLeod,               
          netfilter@lists.netfilter.org                       
                                                              
 cc:                                                          
                                                              
                                                              
                                                              
 Subject: RE: Help - Public Interface seems to go to sleep    
                                                              








>      Problem:
>           - Everything works 'most' of the time. However after no
>             activity on the public interface for a while
> (hours), can not connect.
>             But then later, can connect ??
>            From a tcpdump trace on eth1, the times that it
> will not connect shows
>            only SYN packets from the other host, no ACK from
> this server?
>
>           Have I filtered out too much traffic ?  Should I
> allow ICMP through the
>           public interface ? Bad ethernet card ?
>
I experienced this a whiel back. The IF would just stop responding. I
noticed when I pinged from it when logged in locally that would
sometimes start it back up. But it was only down for maybe 5-10 mins at
a time. I chalked the problem up to I think my power management
settings. The system is a server so I removed the APM aspect of it from
the kernel and I think that solved the problem.





