From: "Josh Larocque" <joshlarocque@technologist.com>
Subject: Customizing LOG output
Date: Mon, 24 Jan 2005 19:32:35 -0600
Message-ID: <20050125013235.210362000C@ws1-1a.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Is there a way to change the data the the LOG module outputs?  As it stands=
 right now it's printing IN, OUT, MAC, SRC, DST, LEN, TOS, PREC, TTL, ID, P=
ROTO, SPT, DPT WINDOW, RES and UGRP... all taking up about 2 and a half lin=
es on the screen for each entry. I'd like to get it down to a one-liner if =
possible.

Thanks,

Josh

