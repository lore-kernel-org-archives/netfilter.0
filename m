From: Justin Friel <capn_shoe@yahoo.com>
Subject: Re: DNAT: Unable to Forward Ports, Why?
Date: Mon, 31 May 2004 15:07:41 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040531220741.25677.qmail@web60005.mail.yahoo.com>
References: <20040531192836.3840.qmail@web41710.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040531192836.3840.qmail@web41710.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter lists <netfilter@lists.netfilter.org>

--- "Kevin D. White" <web_crcrawlzahoo.com> wrote:
> Are you getting any connection attempts on the web
> host?  Log the packets for port 80 in FORWARD and
> INPUT, try and track the packet as it moves through
> the tables.

HmHmmmI don't seem to be getting any hits, unless I
set up logging incorrectly. I set it up as :

# Log all attempts to connect to port 80
$IPIPTI FORWARD 3 -p tctcp-dpdport0 -j LOG \  
 --log-prefix "**FORWARD CHAIN PORT 80 TCP**"
$IPIPTI INPUT -p tctcp-dpdport0 -j LOG --log-prefix \
 3"**INPUT CHAIN PORT 80 TCP**"
# Forward port 80
$IPIPTA FORWARD -d $EXT_IPIPp tctcp-dpdport0 -j ACCEPT
$IPIPTt nanatA PRPREROUTINGp tctcp-dpdport0 \
 -d $EXT_IPIPj DNDNAT-to-destination 192.168.1.2:80


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

