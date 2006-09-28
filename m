From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Marks set in PREROUTING got lost
Date: Thu, 28 Sep 2006 14:31:34 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609281430270.26317@yvahk01.tjqt.qr>
References: <451B0E63.3010806@gmx.de>
	<Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>
	<451B9794.9090209@gmx.de> <451BBD3D.40305@eternet.cc>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451BBD3D.40305@eternet.cc>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Diaz <lucasdiaz@eternet.cc>
Cc: netfilter@lists.netfilter.org

>
> So, something marked with -j MARK can't be matched on nat table, right?

You have to mark it in the PREROUTING chain of the mangle table, to be 
able to match on it within the PREROUTING chain of the nat table.

--- Orig msg ---
> What if after you mark the packet with -j MARK, you do "-m mark --mark X -j
> CONNMARK --save-mark"; it should be visible from nat table or must be marked
> with -j CONNMARK --set-mark?
>
>
>> > What marks, per-packet marks or per-connection marks?
>> > 
>> I am not sure, how to distinguish, I just mark all pakets that pass
>
> -j MARK => per-packet
> -j CONNMARK => per-connection
>
>> through a certain user defined chain. I guess this is a mark per packet.
>> The particular chain lookes like this:
>> 
>> 
>> Chain FWD_WWW-101 (2 references)
>> target     prot opt source               destination
>> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           quota:
>> 100000000 bytes
>> MARK       all  --  0.0.0.0/0            0.0.0.0/0           MARK
>> set 0x65
>> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           quota:
>> 1000000 bytes
>> MARK       all  --  0.0.0.0/0            0.0.0.0/0           MARK
>> set 0x1
>
> MARK is only allowed in the mangle table.
>
>> 
>> 
>> The goal is to provide full network speed for all NATed computers
>> for a certain amount of bytes (first quota match), then mark their
>> packets individually (each computer has its own mangle chain
>> (FWD_WWW-$computernumber)) with its computernumber in hex, so tc can
>> slow down their connection to 56k and after the "slow quota" is used
>> up, the users packets get a different mark  (mark 1) and get a DNAT
>> to an Over Quota webpage, when the user tries to access an outside
>> webpage, other connectionattempts get droped.
>> 
>> 
>> The problem is now, that pakets get marked with the mark 0x1, but in
>> PREROUTING nat table, this mark never appears.
>
> http://www.imagestream.com/~josh/PacketFlow.png
>
> PREROUTING comes before FORWARD.
>
>> 
>> Thanks, Clemens
>> 
>> 
>
> Jan Engelhardt
> -- 
>
>
>
>

Jan Engelhardt
-- 

