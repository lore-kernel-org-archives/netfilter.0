From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: Wed, 23 Oct 2002 10:43:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210230943.g9N9hiL02304@vulcan.rissington.net>
References: <Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain> <1035328874.10494.38.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035328874.10494.38.camel@elendil>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Wednesday 23 October 2002 12:21 am, Cedric Blancher wrote:

> During a pentest, we broke into a box through vulnerable PHP scripts
> (one to upload files, and another one to include them and have commands
> executed). At this point, we are able to execute commands and upload
> binaries, but we do not have a remote shell. So, we launched a netcat
> piped to a shell to connect on, because input flows were not filtered
> properly. Imagine they were, but output policy was to be accept
> anything. We could just get our shell in having our "piped shell" netcat
> connect to the attacking box. So, output stuff would have allowed our
> remote shell just like if there were not much filtering.
>
> This means, that with proper output filtering, we couldn't have achieve
> this this easy, and must have find something else to gain our remote
> shell. That would have make the intrusion far more difficult.

The OUTPUT rules are always going to allow traffic to or from expected ports. 
53 is a good one to guess is going to be made accessible, so you simply set 
up netcat to contact your external system on port 53, and you can still do 
what you've outlined above even with pretty good OUTPUT filters in place.

The trouble is, netfilter only knows about IP addresses and TCP/UDP port 
numbers - it doesn't understand anything about the content of packets being 
sent on those ports, so it can't check that port 53 is being used only for 
DNS queries, port 80 is being used only for HTTP transfers etc.

My point is that if you can break into a machine, you can break out of it 
again, so OUTPUT filters are generally either not much use, or they get in 
the way of your normal applications.

Re the comment "--cmd-owner is your friend", I agree that this is worth 
adding to any OUTPUT rules you do choose to specify, but bear in mind that a 
compromised application or trojan is still going to be running under an 
expected user on the target machine, therefore --cmd-owner isn't necessarily 
going to see anything strange...

If you're concerned about this level of security (which you should be) then 
you need to deal with Operating System security and things like Host 
Intrustion Detection - netfilter is not going to do the job effectively for 
you.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

