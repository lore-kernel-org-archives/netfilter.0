From: Patrick Schaaf <bof@bof.de>
Subject: Re: Nat with virtual interfaces
Date: Thu, 27 Jun 2002 14:12:33 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627141233.A2703@oknodo.bof.de>
References: <BACC2B29B574704A8494EAD86EDBB9501C6130@stosrv-0003.lemonplanet.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <BACC2B29B574704A8494EAD86EDBB9501C6130@stosrv-0003.lemonplanet.com>; from mika.ullgren@lemonplanet.com on Thu, Jun 27, 2002 at 02:03:13PM +0200
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
To: Mika Ullgren <mika.ullgren@lemonplanet.com>
Cc: netfilter@lists.samba.org

Hi Mika,

try to use DNAT instead of REDIRECT, explicitly giving the one or the
other local destination IP address. I guess that since the REDIRECT
target does not take an IP address as an argument, it has a hard time
coping with your multiple-IP seperation issue.

(I'm guessing because I never used REDIRECT for such a setup, so I'm a bit
unsure)

best regards
  Patrick

