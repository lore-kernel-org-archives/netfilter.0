From: "Glen Spidal" <glens@mail.cybercorpinc.com>
Subject: Re: Netfilter or DNS issue?
Date: Wed,  9 Feb 2005 09:42:00 -0800
Message-ID: <200502090942.AA3408310@mail.cybercorpinc.com>
Reply-To: glens@mail.cybercorpinc.com
Mime-Version: 1.0
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: glens@mail.cybercorpinc.com, Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

---------- Original Message ----------------------------------
From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Date:  Wed, 9 Feb 2005 11:23:43 -0500 (EST)

>On Tue, February 8, 2005 4:14 pm, Glen Spidal said:
>> Greetings all,
>
>gug Glen !
>
>>
>> I have constructed a firewall based off of the tutorial at frozentux.  The
>> problem I'm having is that I have two DNS servers with the second being a
>> slave to the first.  I can DIG other domains from the slave DNS server
>> except for my own.  IT appears that the slave DSN server is not getting
>> updated for the primary one. Here's my script:
>
>Can you draw us an ASCII schema of your current setup ?
>
>For me, it appears that both DNS are on the same physical segment and
>logical network.
>
>The DMZ part of your script just confuse my assumption.
>
>Thanks,
>Samuel
>
Here is the diagram.

Public IP for DNS1 is 66.15.233.17  DNS2 is .18
    66.15.233.16
ISP-->Firewall-+------+
               |      |
     [192.168.0.1] [192.168.1.1]
              LAN    DMZ
               |      |          
            SWITCH  SWITCH --+-DNS1 [192.168.1.17](Master)
                             |
                             +-DNS2 [192.168.1.18] (Slave)

From both DNS servers locally I can dig external sites.
From DNS1 I can dig my own domain.
From DNS2 I get a server failure when I try to dig my own domain.  I have created a slave zone on DNS2 for my domain.
From both DNS servers I can do an NSLOOKUP from a remote-site Windows XP machine of external domains.
From DNS1 I can do an NSLOOKUP from a remote-site Windows XP machine of my domain.

-Glen
 




________________________________________________________________
Sent via the WebMail system at mail.cybercorpinc.com


 
                   

