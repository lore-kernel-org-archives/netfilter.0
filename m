From: Chris Brown <chris@wavetex.com>
Subject: Re: Bridging firewall setup
Date: Tue, 16 Dec 2003 11:52:26 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FDF465A.2020103@wavetex.com>
References: <3FDF38FF.3090109@wavetex.com> <200312161707.26462.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312161707.26462.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org


Antony Stone wrote:

>
>I don't know the answer to your question, but in situations like this I always 
>think it's a good idea to turn on some LOGging so you can see where the 
>packets are, and then you can try filtering them.
>
>One thing you could do straight off is just request a detailed listing of the 
>chains, to see if you have any packet counts at all:
>
>iptables -L -n -v -x
>  
>
>will print out the filter tables in the INPUT, FORWARD and OUTPUT chains, and 
>you should see from the byte & packet counters whether packets seem to have 
>been going past.
>
>You can do the same thing with the nat tables to see what happens just before 
>& after the above:
>
>iptables -L -t nat -n -v -x
>  
>
Thanks for the suggestions. I tried these two commands and on both it 
shows 0 packets being filtered. I took the rules out of nat as they 
didn't seem to be doing anything

>However, if you simply put a LOG rule into all five chains, and then send some 
>packet through the bridge, see what gets logged where:
>
>iptables -I INPUT -j LOG
>iptables -I FORWARD -j LOG
>iptables -I OUTPUT -j LOG
>iptables -I PREROUTING -t nat -j LOG
>iptables -I POSTROUTING -t nat -j LOG
>
>  
>
This is a production machine so leaving logging on for extended periods 
isn't an option since it would quickly fill up the logs. However I 
turned in on briefly and even though using tcpdump I see constant 
traffic through the bridge the logs only show traffic going in and out 
to the bridge's IP that I have setup for maintenence, mostly my SSH 
session. Any ideas how I can get it to see the traffic going through?

Chris

-- 
Chris Brown
System Administrator / Web Application Developer
Wavetex Inc.
903-533-1700
http://wavetex.com/


