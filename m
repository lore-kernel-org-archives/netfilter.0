From: "Martin Leduc" <marled3@hotmail.com>
Subject: Re: Problem behind my DMZ
Date: Thu, 08 Jan 2004 17:46:20 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-F95jyNQD9Y7j8J00010259@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

I have clean a bit of text.


>So where are the local client machines?

No one, it's my dedicate server network.  My server are on a metal box with 
one RJ-45 cable from my ISP.  That's it!

My Corporate Lan is provide by an other ISP using an other iptables box.

>>So I have rules
>>iptables -t nat -A PREROUTING -p tcp/udp --port X -s 20.0.0.2 \
>>-j DNAT --to-destination 192.168.0.2:X
>>
>>And my postrouting
>>
>>iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.2 -j SNAT --to-source
>>20.0.0.2

>I still don't understand where the local client machines are on your 
>network.   What you have described above should work fine for clients which 
>are out on the Internet.

See previous

>>My FORWARD rules are WideOpen

>UGH!

I know but I will DROP all after test be done

>>Spliting my DNS is not an option.

>Why not?

Currently, my DNS is already behind my FIREWALL, but answer my public 
address.  Currently, i have more than 600 domain name in my DNS.  So to 
add/remove a domain to my network, I have to register it in my DNS Master, 
DNS slave and my split DNS?  All of my server are behind the Firewall and 
send Email to my mail server who is behind my firewall too.

Example:

My Server 1 (192.168.0.2) tried to send Email to abcd.com.  abcd.com are 
resolved by my internal DNS server.  The MX of the domain abcd.com is 
20.0.0.4, but this address is, from the server 1 point of view my Firewall.  
So I lost the email.

>Regards,

Regards and thanks for Help

>Antony.

Martin

_________________________________________________________________
MSN Search, le moteur de recherche qui pense comme vous !  
http://fr.ca.search.msn.com/


