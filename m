From: stefan_Walther@gehag-dsk.de
Subject: Re: [Fwd: SNAT to allocat IP from an IP Pool]
Date: Wed, 2 Oct 2002 13:14:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF4B4F82EB.37209BA6-ONC1256C46.003D226A-C1256C46.003DBAFF@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: murli@icafe.co.tz
Cc: Antony@Soft-Solutions.co.uk, netfilter@lists.netfilter.org

if you want to use SNAT with multiple IP's you have to do the following:


<--snip-->
iptables -t nat -A POSTROUTING -o <external_interface> -j SNAT --to 
23.23.23.1-23.23.23.15
<--snip-->

you have to know, if you have 16 IP's the 0 is reserved for the network 
and the 16 is reserved for the broadcast address.

i addition you should enable connection tracking:

<--snip-->
iptables -A FORWARD -i <inetrnal_interface> -o <external_interface> -m 
state --state NEW -j ACCEPT
iptables -A FORWARD -i <external_interface> -i <internal_interface> -m 
state --state ESTABLISHED,RELATED -j ACCEPT
<--snip-->

this works for me.

Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

-------------------------------------------------------------- 
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free. 
Examined by DOGMATIC infallibility system. 
Version 6.04




"Mitesh P Choksi" <murli@icafe.co.tz>
Sent by: netfilter-admin@lists.netfilter.org
30.09.2002 23:17
Please respond to murli

 
        To:     <Antony@Soft-Solutions.co.uk>
        cc:     <netfilter@lists.netfilter.org>
        Subject:        Re: [Fwd: SNAT to allocat IP from an IP Pool]


I keep changing my question based on what I learn from this list and from
the other articles on the net regarding netfilter.

As I mentioned in my first email, I had dial-up users, then I mentioned 
that
I had LAN users, actually I have dial-up users on the RAS being allocated
private ip along with other LAN users who have private IP as well. All in
all I have /24 for all the users.
But, I have only 16 public IP address to spare and share among the /24
private IP addresses.

I have seen several ways to rectify this situation:
1. Use DHCP for LAN and dial-up, with a minute or two as lease time
2. Try out LEASE target netfilter extention, and check if it works for me
3. Try out multiple address SNAT, and check if it works for me
4. Try out your suggestion of using logs and dynamically creating and
removing SNAT rules

The need to do this is various public IP address requiring application 
used
by the combination of users on the LAN as well as dial-up.

Since not all LAN + Dial-up users use public IP requiring applications at
the same time, I don't want to spend all my public IP addresses and only
have 16 to spare for users. Any further requests from users for public IP
addresses can be denied access/failover to single IP SNAT.

The idea is to find an intelligent way to share the small set of public IP
addresses among the larger set of private IP addresses.

Hope this gives all a still clearer picture of the situation.

Mitesh

Antony Stone said:
> On Monday 30 September 2002 8:04 pm, Mitesh P Choksi wrote:
>
>> So, how does -SNAT --to 23.23.23.0-23.23.23.16 work.
>>
>> How does this work? I have now tried it but did not dare to go beyond
>> a few seconds.
>>
>> Does anybody have some documentation / pointers on how to use -SNAT
>> and give a range of IP addresses? I will give it a try and see how
>> does -SNAT handle the range of IP addresses.
>
> I cannot answer that - hopefully someone else here is more familiar
> with  mutliple address SNAT; however please can we clarify something
> about your  original question ?
>
> Are you merely trying to do SNAT, to allow internal clients out to the
> Internet, or are you also trying to do DNAT to enable Internet access
> in to  your internal machines as well ?
>
> Antony
>
> --
>
> Success is a lousy teacher.   It seduces smart people into thinking
> they  can't lose.
>
> - William H Gates III








