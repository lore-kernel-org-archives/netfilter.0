From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: NAT and log traffic
Date: Wed, 15 Jan 2003 19:54:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030115195414.02dabc74.arnt@c2i.net>
References: <5.2.0.9.0.20030115122833.08dbb520@imap4.plugit.net>
	<FD8F124A387AD6119F7900A0D218B321019AC2@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321019AC2@hslex01.hslbz.local>
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
To: netfilter@lists.netfilter.org

On Wed, 15 Jan 2003 16:08:03 +0100, 
"Rob Sterenborg" <rsterenborg@xs4all.nl> wrote in message 
<FD8F124A387AD6119F7900A0D218B321019AC2@hslex01.hslbz.local>:

> I think that 10.20.0.0/23 does not cover all of 10.20.2.0/23,
>  10.20.4.0/23, etc...

..output of: $ ipcalc -bnmp 10.20.2.0/23
NETMASK=255.255.254.0
PREFIX=23
BROADCAST=10.20.3.255
NETWORK=10.20.2.0

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



