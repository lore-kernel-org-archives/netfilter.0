From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: Re: block kazaa using iptables
Date: Fri, 25 Apr 2003 10:35:04 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA963B8.5030305@shortcircuit.dyndns.org>
References: <33407.202.138.166.5.1051183732.squirrel@mail.ictuscomm.net>
	<200304251811300248.04387953@smtp.nikonbw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304251811300248.04387953@smtp.nikonbw.com>
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

Wijaya, J. wrote:

>Try not to block the port number, instead of blocking the access to the
>server ip address, this will be a bit difficult, we have to find out all
>the kazaa server addreses.
>
>I have done this task to block yahoo messenger, because yahoo msg will use
>any available port, so it is useless to block 5050 (yahoo port number), so
>i just block all the ip addresses for the yahoo msg servers.
>
>jw.
>
>*********** REPLY SEPARATOR  ***********
>
>On 24/04/2003 at 19:28 PM Wesley Jay Deypalan wrote:
>
>  
>
>>Hi,
>>
>>Is there a way to block kazaa using iptables?Already tried blocking port
>>1214 but to no avail, I heard that kazaa change ports if it cannot connect
>>using 1214.
>>TIA,
>>
>>wesley
>>    
>>
>
>
>
>
>  
>
This has really become a FAQ. The two most common answers are:

1) Find the main server's IP, block that
2) use the patch-o-matic to include string matching into IpTables, and 
then block (if memory serves) packets containing "Kazaa-Client". 
(without the -. The - was included so those who have arleady done that 
will still see this email).




