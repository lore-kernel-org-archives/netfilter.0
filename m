From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP address ranges for USA and Europe
Date: Thu, 02 Jun 2005 13:45:16 -0500
Message-ID: <429F53BC.7070906@riverviewtech.net>
References: <429F4DD2.6080600@jcitc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429F4DD2.6080600@jcitc.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

James Cooke wrote:
> Hi all,
> 
> I'm running a VPN server to which IP tables limits connections to the IP
> addresses of the client offices. However, now the client wants roaming
> access to the VPN via laptops - they will be moving around Europe and
> the USA. There are two layers of password security, but I'm still
> nervous about opening the server to the entire world...
> 
> Therefore, is there a nice way to open the firewall for connections just
> from Europe and USA?
> 
> I've found lots of IP address ranges, but even those don't seem to be
> complete - AOL IPs don't fit in to the list I've compiled so far for
> example. So I'm thinking there's got to be something better than writing
> out a full list of ranges and allowing them connections...
> 
> The SSH brute force thread was very interesting with the recent/tarpit
> trap for our less than welcome guests and I would like to implement this
> on the VPN ports in the future - but for now I'm just looking for a
> quick fix.
> 
> Thanks in advance for any input on this...
> 
> James
> 

A couple of things come to mind, that being GEOIP and having your client SSH in to a server before they set up the VPN.  You could combine the idea behind port knocking as in remembering what port is active or was active and then allow VPN connections from an IP that has an established SSH connection with more than X number of packets or byes.  Take a look at http://netfilter.org/patch-o-matic/pom-extra.html#pom-extra-geoip for more information on GeoIP and http://www.maxmind.com/app/geoip_country for information on where to obtain the database.

I would be interested in seeing what you would like to do with the SSH_Brute_Force idea on your VPN.  I'm getting ready to expand the idea to other things as well and I would be interested in talking to you about what you are wanting to see if I could not role that in to the new version that I'm going to be working on.



Grant. . . .

