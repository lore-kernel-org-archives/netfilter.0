From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Tunneling FTP over SSH through an IPTables NAT/Filter setup...
Date: Tue, 22 Oct 2002 17:15:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210221615.g9MGFrL01517@vulcan.rissington.net>
References: <3DB55231.6050802@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DB55231.6050802@canada.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tuesday 22 October 2002 2:27 pm, Chris Poupart wrote:

> I am trying to tunnel FTP over SSH, as it sais in the subject, using
> Dreamweaver MX as the FTP client and PuTTY as the SSH client.
>
> I believe what this setup does by default is to send the FTP commands
> via the SSH tunnel, but then to return information and send data through
> another port (the FTP client defaults to Passive when I tell Dreamweaver
> to tunnel through SSH.)

Tunnelling through SSH sends everything across the SSH link:

1. This allows private addresses to be used at each end
2. If not everything went through the SSH link it wouldn't be secure
3. This technique is often used to send protocols through firewalls which 
would otherwise be blocked - this shows everything as happening on port 22

> Because the command strings are sent through SSH, the ftp_conntrack
> module will not work to recognize the other connections are RELATED or
> ESTABLISHED.

Where is your firewall in relation to the two machines which are running SSH 
between them ?

If the firewall is in between the SSH client & server it only has to know 
about TCP port 22.

If the firewall is between one of the SSH machines, and one of the FTP client 
or server (if these are not the same as the SSH endpoints), then it only 
needs to know about FTP.

If the firewall is on the same machine as the FTP client or server, which is 
also one of the SSH endpoints, then you might need to do a bit of LOGging to 
see what SSH packets and what FTP packets you get from whcih interfaces going 
where....   It won't be simple.

> What I end up with is a connection, through which I can not browse the
> remote directories, nor upload or download files.  FTP by itself works
> fine.

This sounds like an SSH port mapping problem to me, not a netfilter problem.

If netfilter is allowing the SSH link to get set up, it doesn't need to do 
anythng else to run FTP across it - that's all handled by the SSH 
configuration.
>
> The rules are pretty simple.  Defaut drop policies, followed by standard
> MASQ rules, and then INPUT rules that only allow RELATED or ESTABLISHED
> rules back in.  There are no OUPUT rules for the moment.

Try adding a LOG rule to the end of your INPUT and FORWARD chains to see what 
packets are about to get DROPped by the default policy.   That should give 
you some clues about what packets are not getting through.

> The funny thing is, if I use the SSH client from SSH.com, they have an
> "FTP" mode for tunneling, and that works fine with my setup.  I guess
> that it has some built in connection tracking itself?

It almost certainly means that it sets up the SSH port forwarding 
automatically for you instead of you needing to set up the port maps at each 
end of the SSH link yourself.

The fact that this client works means that it's not your netfilter rules 
which are the problem.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

