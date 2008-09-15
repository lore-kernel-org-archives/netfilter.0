From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables not prevent access
Date: Mon, 15 Sep 2008 12:44:45 +0200
Message-ID: <759EF8A91CDD462F891EAD687635162A@dcyb.net>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net> <9518B26607784D55A361431633134C9B@dcyb.net> <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'Xu, Qiang (FXSGSC)'" <Qiang.Xu@fujixerox.com>, netfilter@vger.kernel.org

>> Is there a rule that would accept the http packet before it
>> would hit this rule?
> 
> Actually, this is the only rule that exists in the server.

Okay.

>> Place a LOG rule identical to the REJECT rule in front of it
>> and look in your messages log if it hits:
>> 
>> $ipt -A INPUT -i eth0 -s 13.121.8.119 -p tcp --dport 80 -j LOG \
>>   --log-level info --log-prefix "IPT: TEST: "
>> $ipt -A INPUT -i eth0 -s 13.121.8.119 -p tcp --dport 80 -j REJECT
> 
> We don't have "ipt" command, only "iptables" command, and

Yes.. $ipt would be a variable substituted by the actual iptables command.

> "iptables --help" shows it doesn't support a option of "--log-level"
> =====================================
> GUMP:/tmp/nvram <45> iptables -A INPUT -i eth0 -s

I'm looking at /tmp/nvram.. Is this a dedicated wireless router using
something like DD-WRT or OpenWRT?

> 13.121.8.119 -p tcp --dport 80 -j LOG  --log-level info --log-prefix
> "IPT: TEST: "
> iptables v1.2.8: Unknown arg `--log-level'
> Try `iptables -h' or 'iptables --help' for more information.
> =====================================

Well, IIRC the --log-level has been supported since forever (or so?) by the
LOG target.

iptables -j LOG --help
[...]
LOG v1.3.6 options:
 --log-level level    Level of logging (numeric or see syslog.conf)
 --log-prefix prefix  Prefix log messages with this prefix.


man iptables
[...]
  --log-level level
    Level of logging (numeric or see syslog.conf(5)).

  --log-prefix prefix
    Prefix log messages with the specified prefix; up to 29
    letters long, and useful  for  distinguishing messages
    in the logs.

>> If it doesn't hit, either the rule is incorrect (for what you
>> want it to do) or another rule has already accepted the packet.
> 
> What's strange is that, when I run the same command to other
> machines, say 13.121.8.120, the http access is successfully
> rejected. Does that mean something wrong with the network
> configuration of the machine 13.121.8.119? What is the
> possible cause of that behavior?

I can't possibly say unless I could see the configuration of each machine.
If these IP's are the actual IP addresses and should reachable on the
internet so they can be tested, I can tell you that both IP's return
"filtered" for http requests.

> Another thing is quite strange, when capturing network trace
> from and to 13.121.8.119, I can't find any packet associated
> with the server which runs "iptables" command. However, when
> I was capturing network trace from and to 13.121.8.120 (which
> was successfully blocked), I can see some network packets associated
> with the server. 
> 
> Got confused...

Me too: I don't know anything about your setup. The way you describe it the
logical thing would be that the rule works as expected like it does on the
other machine, but right know I couldn't tell you what's happening. Perhaps
someone else here has a clue.


Grts,
Rob

