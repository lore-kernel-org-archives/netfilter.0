From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: intelligent load balancing
Date: Tue, 3 Jan 2006 10:28:56 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0601031027550.3566@yvahk01.tjqt.qr>
References: <BAY103-F148EEBC380AA0B3B51509CB22C0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F148EEBC380AA0B3B51509CB22C0@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@lists.netfilter.org


> The main problem are 'download' packets which can be per-connection
> balanced only.

Correct, and you can't do anything about it unless your ISP supports some 
sort of bonding or does some tc on _their_ side.


Jan Engelhardt
-- 

