From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 15:37:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A1397E.4020508@pbl.ca>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>        <200405102115.14089.Antony@Soft-Solutions.co.uk>        <1292.192.168.74.154.1084226963.squirrel@192.168.74.154>        <1084227992.14224.5.camel@localhost>        <1166.200.44.170.105.1084283379.squirrel@200.44.170.105>       <1084288178.15768.10.camel@localhost>    <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>    <40A0FEC7.7020201@pbl.ca> <3440.200.44.170.105.1084303244.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3440.200.44.170.105.1084303244.squirrel@200.44.170.105>
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
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

alucard@kanux.com wrote:
> mmm not at all, it's a cisco router for one of the t1's for the company I
> work for.

Hm, doesn't change much in the hole picture.  What you'll need to do 
depends much on how much you are allowed to change (and you'll have to 
change something, there's no way around it).  If you are allowed to 
change internal IP address on Cisco, than you can use your Linux box as 
router/firewall for internal network (as per diagram I sent earlier). 
That would move Cisco out of your internal network (good thing (tm) 
since you don't control it, and obviously you are not very keen of 
person who does have control over it), and than you can do close to 
about anything you desire.

BTW, one stupid question, you did set ip_forwarding to 1 on Linux box, 
right?  As I recall, it defaults to 0 (either in kernel, or startup 
scripts in various distributions set it to 0, not sure).

What John just suggested with virutal interfaces will also work.  But 
with only one physical interface you must be carefull about ICMP 
redirects.  Your Linux box is going to start spitting them out as soon 
as it detects two networks on same wire, unless you specifically tell it 
not to do that.  If Cisco and Web2 boxes are set to obey them (bad thing 
(tm)), they'll just start talking directly to each other.  Been there, 
done that.

Anyhow, whatever you choose to do, I would stronly recommend having two 
seperate wires.  One for your internal network, and another for outside 
world.  And since you don't have control over Cisco, it boils down to 
two NICs in your Linux box or two NICs in your Web box.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

