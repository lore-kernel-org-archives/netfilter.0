From: "Mitesh P Choksi" <murli@icafe.co.tz>
Subject: RE: are these enough now?
Date: Fri, 4 Oct 2002 21:34:26 +0300 (EAT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <51370.64.86.49.17.1033756466.squirrel@www.icafe.co.tz>
References: <000101c26bbf$f205b0e0$731010ac@motion>
Reply-To: murli@icafe.co.tz
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c26bbf$f205b0e0$731010ac@motion>
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
To: ctodish@crayon.com
Cc: netfilter@lists.netfilter.org, payal@hotpop.com

I recovered and found another way out.

Do a
lsattr /bin/netstat
lsattr /bin/ps
lsattr /sbin/ifconfig

If you find any of the attributes set, unset it using
chattr -i /bin/netstat
chattr -i /bin/ps
chattr -i /sbin/ifconfig

Then installing the rpm's net-tools and procps and psmisc using --force, it
worked out and I could see the process as well as the

Tripwire reports the differnce very efficiently, lsattr reports the change
and chattr + rpm --force fixes it.

What a major problem to people like me using space segment to connect to hte
internet is the packets keep coming in and you need to ask your provider
stop it on the other side of the satellite link. The ports don't just stay
at 2002, I have seen 3 different ports. You will find processes like xntps,
cinik, etc. running as well.

If re-installation is not possible instantly, like in my case, tripwire
reports really help.

Regards,

Mitesh

Clint Todish said:
>
> '/usr/sbin/lsof -i udp:2002' - sorry - M$OUTLOOK wants to cap that -i
> for some reason.
>
> -C
>
>
> -----Original Message-----
> From: Clint Todish [mailto:ctodish@crayon.com]
> Sent: Friday, October 04, 2002 10:59 AM
> To: 'netfilter@lists.netfilter.org'
> Cc: 'PayalR'
> Subject: RE: are these enough now?
>
>
> More than likely, someone pushed over a root kit to cover their
> tracks...if netstat -an doesn't show 2002 open, then you can be sure of
> it. Chances are, they've also replaced ps as well to hide the
> process...try: '/usr/sbin/lsof -I udp:2002' to get the PID. If you are
> running a RedHat install - 'rpm -Va' and look for a '5' in the 3rd
> position as that indicates a MD5 checksum difference from the binary on
> your machine and the original package.
>
> Personally, I would recommend a reinstall as you never know for sure
> what may be left lurking around.
>
> -C
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> Sent: Friday, October 04, 2002 8:09 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: are these enough now?
>
>
> On Friday 04 October 2002 12:25 pm, PayalR wrote:
>
>> Hi all,
>> Thanks a lot for the mails.
>>
>> > 161 - snmp - are you managing this system from elsewhere, or is this
>> > machine the snmp monitor ?   UDP 161 only needs to be inbound if
> this
>> > machine is being monitored from elsewhere
>>
>> Well, I don't know anyting about SNMP thing. But the guys at the
>> server farm suggested I make some changes as told by them in my
>> snmpd.conf, so that they say I there will be able to monitor my
>> machine. I guess so I am just a client SNMP. So, which ports to keep
>> open?
>
> UDP 161 inbound - to listen for SNMP commands
> UDP 162 outbound - to generate SNMP traps
>
>> > > Also, nmap shows that 2002/udp globe is open. Shall I close it?
>> >
>> > machine already has the Slapper worm on it, since that opens UDP
>> > port 2002
>>
>> well, my machine had a slapper worm. I removed the .bugtraq file from
>> /tmp. Now still the port is open. This is very important to me. How do
>
>> I close the port???? nmap report says,
>> 2002/udp   open        globe
>> How do I know where and what is globe? How do I shut it?
>
> Sorry - don't know - never had Slapper :-)   Anyone else here got any
> experience or pointers ?
>
>> > I would recommend setting your OUTPUT chain to ESTABLISHED,RELATED
>>
>> do you mean similar to INPUT rule i.e using -m and all?
>
> Yes.
>
> Antony.
>
> --
>
> Behind the counter a boy with a shaven head stared vacantly into space,
> a dozen spikes of microsoft protruding from the socket behind his ear.
>
> - William Gibson, Neuromancer (1984)




Regards,

Cyberdude Murli
The Earth



