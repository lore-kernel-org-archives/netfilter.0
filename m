From: Danny Rathjens <gmane@rathjens.org>
Subject: Re: matching -d to a given interface without specifying ip address
Date: Wed, 06 Sep 2006 14:11:08 -0400
Message-ID: <edn2vt$4dl$1@sea.gmane.org>
References: <009601c6cfdf$c4406910$0101000a@tanjian> <44FD003D.7080509@nth.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44FD003D.7080509@nth.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dmitri wrote:
> The problem with specifying an IP is that it may change, which breaks 
> the rules and requires an update (and detection as well). Event for a 
> static IP, that's an extra dependency to watch out for.
 
That's what variables in your firewall script are for.
Just re-run it when your network connection restarts:
EXTIF="eth0"
EXTIP=`ifconfig $EXTIF |perl -ne'print $1 if /inet addr:([\d.]+)/'`
iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 80
-- 
     _.,-*~`^'~*-,._ Danny Rathjens _.,-*~`^'~*-,._
FireCast: Rock solid kiosk software: http://www.wirespring.com/


