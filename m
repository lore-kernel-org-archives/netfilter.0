From: "Mitesh P Choksi" <murli@icafe.co.tz>
Subject: Re: [Fwd: SNAT to allocat IP from an IP Pool]
Date: Tue, 1 Oct 2002 00:17:26 +0300 (EAT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <43876.64.86.49.17.1033420646.squirrel@www.icafe.co.tz>
References: <20020930191759.YMUT13996.mta05-svc.ntlworld.com@there>
Reply-To: murli@icafe.co.tz
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020930191759.YMUT13996.mta05-svc.ntlworld.com@there>
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
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

I keep changing my question based on what I learn from this list and from
the other articles on the net regarding netfilter.

As I mentioned in my first email, I had dial-up users, then I mentioned that
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

The need to do this is various public IP address requiring application used
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




