From: "ads nat" <adsnat@hotmail.com>
Subject: Re: Setting up default policy to 'DROP' problem
Date: Tue, 03 Feb 2004 21:23:04 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F85bbBiq2wXaJp00069846@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: JALaramie@Loudoun-Fairfax.com, netfilter@lists.netfilter.org

I realy appretiat your support and feelings to help others.

With your support I have succedded in setting up default policy drop for=20
INPUT, OUTPUT and FORWARD. Will post rules soon.

I know I have taken long time to understand this technology. But I can not =

rush until I get my fundas clear.
Once again Thanks for support.


>From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
>To: netfilter@lists.netfilter.org
>Subject: Re: Setting up default policy to 'DROP' problem
>Date: Tue, 03 Feb 2004 08:49:39 -0500
>
>ads nat wrote:
>
>>I have setup DMZ firewall as per Oskar Anderson tutorial on Netfilter.org=
=20
>>site.
>>
>>When I set up default policy to drop for INPUT, OUTPUT and FORWARD chains=
=20
>>as mentioned in the tutorial my connection drops.
>>I am attaching my iptables rules listing.
>>Is there anything wrong in the IPtable rules.
>>When I setup default to ACCEPT everything works fine.
>>Help appreciated.
>>Thanks
>>
>
>I've responded to your postings before, so I was hoping someone new might =

>give this a shot. I know that you've been trying for months to get this=20
>configured, but you're having problems with the basics and you've still go=
t=20
>a long way to go. Oskar's tutorial is a great place to start, but you may =

>want to try reading some other documentation to see if it helps you. You=20
>may also want to look at using a tool like shorewall to help you create=20
>rules.
>
>That said, I'll do what I can to help you. Try using: iptables -L -n -v -x=
=20
> > /var/log/iptables.report. Open up iptables.report in a text editor and =

>turn off word wrap so you can see one rule on each line. When I review=20
>rules I make the font really small and print the ruleset out 'landscape'=20
>oriented so I can see a whole rule printed out on a line.
>
>Look at the number of packets hitting each rule. I think you'll be=20
>surprised where the packets are going. Remember that the rules are=20
>transversed from top to bottom in each ruleset. As soon as a packet matche=
s=20
>a rule it stops (except logging) and doesn't go to the next rule in the=20
>chain. Try starting out with a new script and only a couple rules. Test th=
e=20
>configuration and then use iptables -L -n -v -x again to see if the packet=
s=20
>are going where you think they should. For more details you can also add=20
>logging rules then check /var/log/messages to see the packet flow in more =

>detail. Once you have the basic routing working you can add the filtering =

>rules back in. If you have problems post your new rules back to the list s=
o=20
>we can see what you've done.
>
>Good Luck
>
>Jeff
>
>

_________________________________________________________________
Gifts for Him & Her. Valentine=92s Day.  http://go.msnserver.com/IN/42197.a=
sp=20
At MSN Shopping.


