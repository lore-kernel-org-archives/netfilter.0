From: Christian Riechmann <riechmann@fgan.de>
Subject: Re: Need some clarification or help
Date: Fri, 23 Apr 2004 12:22:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040423102206.GB1280@rie.rie.priv>
References: <20040422213202.GB2328@rie.rie.priv> <Pine.LNX.4.44.0404230900470.16402-100000@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0404230900470.16402-100000@filer.marasystems.com>
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
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org

Henrik,

On 2004-04-23 09:02:40 +0200, Henrik Nordstrom wrote:

> > I do not know whether this proposal is feasable, because I need a 1-to-n
> > tunnel and the tunnel should allow broadcast addressing. Perhaps you
> > can help me.
> 
> I don't see why tun device can not help you there. It is just another 
> method of getting packets in/out of userspace.
> 
> It can even be member of a bridge if you like (tap mode), allowing a 
> tunneled brigde operation.

Thanks for this advice, I will look at the vtun stuff. Maybe I have
to move the code.

Regards
Christian

-- 
Christian Riechmann    E-Mail: riechmann@fgan.de
c/o FGAN/FKIE          Tel: (+49) 228/9435 345,378
Neuenahrer Strasse 20  Fax: (+49) 228/9435 685
D-53343 Wachtberg, Germany

