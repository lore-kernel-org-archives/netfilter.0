From: Alexander Demenshin <aldem-nf@nospam.aldem.net>
Subject: Re: Libipq problems...
Date: Wed, 21 May 2003 20:39:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030521203954.A21105@base.aldem.net>
References: <000201c31f8b$64eec270$66cf858b@ENTERPRISE>
Reply-To: Alexander Demenshin <aldem-nf@aldem.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000201c31f8b$64eec270$66cf858b@ENTERPRISE>; from michael@erg.abdn.ac.uk on Wed, May 21, 2003 at 12:23:24PM +0100
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
To: netfilter@lists.netfilter.org

On Wed, May 21, 2003 at 12:23:24PM +0100, Michael Forrest wrote:

> I'm using a QUEUE target with an appropriate program for receiving the
> packets in userspace, I'm almost 100% certain the program works. It

  AFAIK, the netfilter code won't see any traffic which is not destined to
  your computer. Promiscuous mode will enable to receive all packets if you
  do this through packet socket (or similar means), but it won't force the
  netfilter to process it.
  
Regards,
/Al

