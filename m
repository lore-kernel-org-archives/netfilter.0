From: cc <cc@belfordhk.com>
Subject: Re: PCAnywhere and netfilter
Date: Wed, 02 Jul 2003 12:21:33 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F025DCD.2060004@belfordhk.com>
References: <Pine.LNX.4.44.0306301314470.31613-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0306301314470.31613-100000@localhost>
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
To: Chris Wilson <chris@netservers.co.uk>, netfilter@lists.netfilter.org

Chris Wilson wrote:

Hi Chris!

Just want to update that it's now working!  There were
a few issues that contributed to me having so much
trouble.

1) We were running two different broadband suppliers.
   One was being phased out while the other was being
    phased in. :)  So the PCAnywhere system wasn't using
     the right Router (don't know if this actually makes
    any difference).

2) I was using a my workstation (has PCAnywhere installed)
   to log on to the other PCAnywhere station but via the
   Internet IP and not the stated local IP.  Meaning,
    if aa.bb.cc.dd was my given Internet IP, I'd use my
    local station to access the aa.bb.cc.dd to access
    the PCAnywhere station.

(I know. Stupid, but I needed to test whether or not I could
connect.  I know using the actual machine's LAN IP works.  I
just didn't know if I could go via the External IP.

   ie.  MyMachine -> Firewall's Ext IP -> PCAnywhere.)

Anyway, it works.  I'm surprised I'm had so much trouble
with this.  It seemed pretty straight forward.

Thanks for all the help Chris!

Edmund


-- 
email: cc@belfordhk.com  | "A man who knows not where he goes,
                         |  knows not when he arrives."
                         |                - Anon


