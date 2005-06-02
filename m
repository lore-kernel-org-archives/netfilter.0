From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: port filtering
Date: Thu, 02 Jun 2005 10:18:33 -0500
Message-ID: <429F2349.5020605@riverviewtech.net>
References: <1117723215.10257.6.camel@debianbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1117723215.10257.6.camel@debianbox>
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

Sadus . wrote:
> Is there a way to do port filtering as in allow only FTP protocol use
> port 21 and no other protocol such as opening apache on port 21 or
> openning SSH on port 443 which should ONLY be used for HTTPS?

To enforce only ftp access on port 21 you will need to run some sort of filter that will enforce only ftp commands or something else that will detect ftp commands or not.  The Layer 7 match extension will do this for you.  There are caveats to using the l7 filter as it tends to be less and less accurate the more complex the protocol is, but ftp does not fall in to this category.  L7 filter will put some additional load on your firewall / router too as it has to inspect the higher layer packet and pass it through a regular expression to match (or not) the packet, hens you don't want all your traffic to pass through a l7 filter, just the traffic that is destined to or from port 21.  I might also suggest that you conn mark the known ftp traffic so you can match against the mark on subsequent packets and not have to pass all the packet to any given connection through the l7 filter, just enou
 gh to identify the traffic.  For more information on the "Application Layer Packet Classif
ier for Linux" (Layer 7) go to http://l7-filter.sourceforge.net/ and take a look.  I have played with the l7 filter a little bit and was fairly impressed, however I do not currently have it on any of my production firewalls.  If you need / want more help with this let me know.



Grant. . . .

