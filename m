From: "Martin Paulat" <martin@inter-zone.de>
Subject: Identify eDonkey Packets
Date: Mon, 2 Dec 2002 12:32:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007901c299f6$8da090b0$0102010a@flatline>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi,

I would like to mark any edonkey packets for traffic shaping. i tried to
identify those packets by sourceport/destport, but many clients use
different ports (i.e. 80).

i read that the first data byte identifies the edonkey packet, but how can i
filter it out?

any suggestions?

many thanks,
    martin


