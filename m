From: Philip Craig <philipc@snapgear.com>
Subject: Re: CONNMARK & state RELATED
Date: Wed, 03 Mar 2004 10:34:45 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40452825.8020705@snapgear.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122F03@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122F03@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

Daniel Chemko wrote:
> Does anyone know if these two technologies are compatible?

Yes, they are compatible.  RELATED connections inherit the conntrack
mark from the parent.

> I am using CONNMARK to do policy routing. I use it to select which WAN
> interface the packet will leave the system. It seems that CONNMARK
> doesn't mark related traffic. This makes it very hard to implement what
> I am trying to do.
> 
> My rules are as follows:
> 
> ${IPTABLES} -t mangle -A PREROUTING --source ${_fip} --destination
> ${_sip} -p ${_proto} -j CONNMARK --set-mark ${_fwmark} -m mark --mark 0

There are two types of marks.  There is a conntrack mark, and there
is a packet mark.

The above rule only sets the conntrack mark.  This conntrack mark
will automatically be set for related connections.

But if you want to do routing based on this mark, you have to copy
it into the packet mark for every packet in the connection:

${IPTABLES} -t mangle -A PREROUTING -j CONNMARK --restore-mark

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


