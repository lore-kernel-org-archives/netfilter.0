From: Shane Hickey <shane@howsyournetwork.com>
Subject: Re: ftp passive ports and their state
Date: Wed, 27 Sep 2006 16:48:37 -0600
Message-ID: <20060927164837.3885411c@daneel.volumen.net>
References: <451AF753.4020703@gabrix.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451AF753.4020703@gabrix.ath.cx>
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

gabrix <gabrix@gabrix.ath.cx> [2006-09-28 00:12]:
> I have a debian sarge kernel 2.6 stable and proftpd as ftpd ... .My
> ftpd is open to internet users and i accept passive ftping.I have
> inserted a PassivePorts 60000 65534 directive in proftpd.conf for
> passive connections which it's still a hole of 5534 ports in my
> firewall.Could i accept connections to this ports  in a state
> ESTABLISHED,RELATED in my iptables script ?

If you haven't already, you might want to check out the ip_conntrack_ftp and ip_nat_ftp modules.  I believe they do some sort of magic with passive FTP.

Shane

-- 
Shane Hickey <shane@howsyournetwork.com>: Network/System Consultant
GPG KeyID: 777CBF3F
Key fingerprint: 254F B2AC 9939 C715 278C  DA95 4109 9F69 777C BF3F

