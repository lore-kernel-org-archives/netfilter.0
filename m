From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Internal machines can't resolve external addresses
Date: Wed, 12 Jun 2002 11:13:51 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020612151351.GH21405@cannon.eng.us.uu.net>
References: <003801c2120c$eb198160$020aa8c0@matttm9svd8lrh> <000001c21222$f17749f0$7200a8c0@blue>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <000001c21222$f17749f0$7200a8c0@blue>
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
Content-Transfer-Encoding: 7bit
To: Glover George <dime@gulfsales.com>
Cc: 'Matthew Hellman' <mhellman@raccoon.com>, 'Michael Hudin' <hudin@zoetrope.com>, netfilter@lists.samba.org

On Wed, Jun 12, 2002 at 10:07:55AM -0500, Glover George wrote:

> Yes I've come across this problem MANY MANY times before, and would
> appreciate it if someone could explain exactly why this doesn't work.
> For instance.  I have 3 machines, a firewall/nat (linux), a linux
> webserver and a windows machine behind it.  Now I am serving a website
> that is on the webserver behind the firewall, and it's dns stuff is
> somewhere out on the internet.  On my windows machine it resolves to the
> public interface of the firewall.  Why doesn't packets destined for that
> machine realize that they must be sent to the webserver instead of out
> on the public interface? I know it's because the DNAT rule is on the
> prerouting of the external nic, but why doesn't simply putting a DNAT
> rule on the internal work as well?  

Think logically. It's very obvious why it doesn't work.

http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

Ramin

> 
> The only way for me to get this working is to run bind 9 and set up two
> different views, to resolve different ip addresses whether you're on the
> internet, or in my internal network.  But this is a hack, and everytime
> I add someones website, I have to make changes to both views on the DNS
> server to get it to work, for every host in that new domain.  It seems
> like there should be an easier way, as I'm sure a LOT of people on this
> list come across the same problem before.
> 
> May not be possible with the current nat framework, but was just
> wondering if someone could elaborate on it.  As always, thanks in
> advance.
> 
> Glover George
> Systems/Networks Administrator
> Gulf Sales & Supply, Inc.
> dime@gulfsales.com
> (228)-762-0268

