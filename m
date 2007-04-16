From: Ronald <ronald645@gmail.com>
Subject: Re: Unable to block ICMP
Date: Mon, 16 Apr 2007 18:53:56 +0200
Message-ID: <4623AA24.4000002@gmail.com>
References: <46224132.4080702@gmail.com> <4622A0A4.70007@yahoo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding;
	b=YHauSBKtiJzJKEmaHqNfVeLwLsVcga7ydp8c9NsGXtdLvjMa6YU1yRAiyQ3KPomFYS9UDNN0YURaCBhJ03MXHfMZYJiCV3POu3xmfWnpkpljxv/3+ug1RyYsPw7yBbDgsjLhahj4EREWOog0NWqG+PWV/mL5JvF7OS3DsYQpfx8=
In-Reply-To: <4622A0A4.70007@yahoo.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Hissler <mhis38@yahoo.de>
Cc: netfilter@lists.netfilter.org

Michael Hissler schreef:
> Ronald wrote:
>   
>> Check this thread (posted by me):
>>
>> http://forums.fedoraforum.org/forum/showthread.php?t=152539
>>
>> Could anyone help me here with the problem please ?
>>
>>                                                                        
>>                                 Ronald
>>     
>
> Hi Ronald,
>
> I don't know why your ports are 'closed' instead of 'stealthed', but it
> has nothing to do with ICMP. ICMP doesn't use ports, so it's impossible
> to send a ping to a port, especially a TCP or UDP port as those are
> completly different protocols.
>
> Are you using the 'Stealth Test'? This test sends TCP and UDP packets to
> your IP, but no ICMP packets. There's a test called 'TCP ping packet',
> but this has nothing to do with ICMP echo request, so dropping ICMP will
> not solve your problem.
>
> BTW: Dropping *all* incoming ICMP packets is a bad idea. You should
> ACCEPT ICMP type 3 (destination unreachable), type 11 (time exceeded)
> and perhaps type 12 (parameter problem), as those ICMP packets indicate
> transmission errors you (your applications) probably want to know about.
>
> I just tried the 'Stealth Test' on pcflank.com and the result is
> 'stealthed' for all tests, but the following could be the interesting part:
>
> "We have sent following packets to TCP:1 port of your machine:"
>
> If my interpretation is correct, it means that the packets are sent to
> port 1/tcp (and the UDP packet to port 1/udp).
>
> Add the following line to your rules:
>
> iptables -A INPUT -p tcp --dport 1 -j DROP
>
> Then, the test should result in 'stealthed' for all TCP tests, but
> 'closed' for the UDP test.
>
>
> michael
>
>
>   
That is weird, if you block ICMP outgoing in comodo, all the closed 
ports are shown as stealthed. This is really confusing ...

