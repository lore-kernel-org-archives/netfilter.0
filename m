From: "Glover George" <dime@gulfsales.com>
Subject: RE: Internal machines can't resolve external addresses
Date: Wed, 12 Jun 2002 11:48:46 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <000001c21231$082030a0$7200a8c0@blue>
References: <200206121516.g5CFGLU13571@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206121516.g5CFGLU13571@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Thank you for the explanation.  By far much better than "think
logically" as someone else puts it.  You know if you think a questions
is stupid, don't answer it.

Glover George
Systems/Networks Administrator
Gulf Sales & Supply, Inc.
dime@gulfsales.com
(228)-762-0268


-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
Sent: Wednesday, June 12, 2002 10:16 AM
To: netfilter@lists.samba.org
Subject: Re: Internal machines can't resolve external addresses

On Wednesday 12 June 2002 4:07 pm, Glover George wrote:

> Yes I've come across this problem MANY MANY times before, and would
> appreciate it if someone could explain exactly why this doesn't work.
> For instance.  I have 3 machines, a firewall/nat (linux), a linux
> webserver and a windows machine behind it.  Now I am serving a website
> that is on the webserver behind the firewall, and it's dns stuff is
> somewhere out on the internet.  On my windows machine it resolves to
the
> public interface of the firewall.  Why doesn't packets destined for
that
> machine realize that they must be sent to the webserver instead of out
> on the public interface?

They do.

The problem is the reply packets.

Your windows machine has a local network address.   It tries to contact
the 
public address of the webserver, goes through the firewall (default
route), 
gets DNATted to the private address of the webserver... so far no
problem.

Then the webserver replies to the local address of the windows machine -
ooh, 
it's local, therefore it doesn't have to go through the firewall,
therefore 
it doesn't get reverse NATted by netfilter.

So your windows machine contact a public address and gets a reply from a

local machine.   Doesn't like it, therefore no connection.

 

Hope this helps.

 

Antony.




