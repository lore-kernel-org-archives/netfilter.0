From: DCulp@mcleodhealth.org
Subject: Re: firewall + tcpdump
Date: Tue, 30 Mar 2004 10:25:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFE4435234.99DE03D8-ON85256E67.0054A666-85256E67.0054BBC1@mcleodhealth.org>
References: <40698F5B.8060204@n-dsi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40698F5B.8060204@n-dsi.com>
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
To: Peggy Kam <ppkam@n-dsi.com>
Cc: netfilter@lists.netfilter.org





Peggy,
      Enable logging within your rules , and then check the log files.

David


                                                                           
             Peggy Kam                                                     
             <ppkam@n-dsi.com>                                             
             Sent by:                                                   To 
             netfilter-admin@l         netfilter@lists.netfilter.org       
             ists.netfilter.or                                          cc 
             g                                                             
                                                                   Subject 
                                       Re: firewall + tcpdump              
             03/30/04 10:16 AM                                             
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           




As you have said that all traffic hitting the interface is seen whether
netfilter allows it or not, my question was how do I know whether the
packets being sent get blocked?

>Not sure quite what you by "in front or behind", however I can tell you
that
>tcpdump works "closer to the wire" than netfilter, so it will see all
traffic
>hitting the interface, whether netfilter allows it or not.
>
>
>
>>If it dumps traffic in front of a firewall, would anyone kindly suggest
>>a way to test the firewall?
>>
>>
>
>Um, test it by sending packets which should be allowed, and making sure
they
>are, then sending ones which should be blocked, and making sure they are?
>
>Or have I misunderstood the question?   How would you propose to use
tcpdump
>to test the firewall anyway?
>
>Regards,
>
>Antony.
>
>
>
>





