From: Ruprecht Helms <rhelms@mayn.de>
Subject: Re: firewall startup script
Date: 01 Aug 2003 13:56:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059738996.8263.4.camel@linux.local>
References: <3F2A46F4.9070001@gmx.net>
Reply-To: rhelms@mayn.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2A46F4.9070001@gmx.net>
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
To: Felix Bauer <felixathome@gmx.net>
Cc: netfilter@lists.netfilter.org

On Fri, 2003-08-01 at 12:54, Felix Bauer wrote:
> Hi,
> 
> if got a question about my script for my router-configuration. It should 
> enable ip4warding, masquerade my local hosts,
> allow my local hosts everything and open some ports which should be 
> external available but if I run this script
> it kinda stops after masquerading (I can read the output on the console 
> but then everything is freezed since the local
> ports aren't open anymore and not reopend by the script). Is there any 
> logical error I missed?


>...

>      #** setup Masquerading
>       echo "Creating rule for Masquerading"
>       $iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

>...

You have to open a internetconnection and than pick up the ip-adress for
ppp0 from ifconfig and use it for ppp0. After this act you can start
your firewall.

Regards,
Ruprecht


-----------------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung

Tel./Fax  +49[0]7621 16 99 16
Homepage: http://www.rheyn.de
email:    info@rheyn.de
------------------------------------------------


