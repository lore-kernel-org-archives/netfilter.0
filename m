From: Les Mikesell <les@futuresource.com>
Subject: Re: Blocking IP
Date: Thu, 29 Jul 2004 08:42:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091108541.9541.1.camel@les-home.futuresource.com>
References: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de>
	 <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
	 <200407291410.24531.victor@nk.nl>
	 <004201c47569$4838bbb0$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004201c47569$4838bbb0$858310ac@suarapembaruan.com>
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
To: david <david@suarapembaruan.co.id>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-07-29 at 07:40, david wrote:
> Dear Victor,
> 
> I still receive traffic from that ip.......

Tcpdump/iptraf will still show blocked packets even though
they are not passed to applications.  Is sendmail still
logging connectons from there?

---
  Les Mikesell
    les@futuresource.com



