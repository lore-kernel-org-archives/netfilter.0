From: Payal Rathod <payal-iptables@staticky.com>
Subject: Re: natting help needed urgently.
Date: Tue, 9 Sep 2003 16:41:36 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030909111136.GB1846@linux.local>
References: <20030909031922.GB2818@linux.local> <20030909080918.28191.qmail@web20710.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030909080918.28191.qmail@web20710.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Tue, Sep 09, 2003 at 01:09:18AM -0700, ads nat wrote:
> Requesting you to specify how you have solved yourself. It will help us .
> Thanks

I made an alias for eth0:1 for that external ip on linux box.
That made linux box accept the traffic. Then I made a nat rule like,

iptables -A PREROUTING -t nat -d <ext ip> -j DNAT --to <int ip>

Thanks all again.
With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

