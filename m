From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: Re: quota and time patch.
Date: Fri, 27 Sep 2002 09:29:01 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1832391719.20020927092901@texlab.com.uz>
References: <F91y07vQONDZsbg5YX600007f11@hotmail.com>
Reply-To: Alexey Talikov <alexey_talikov@texlab.com.uz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F91y07vQONDZsbg5YX600007f11@hotmail.com>
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
To: SB CH <chulmin2@hotmail.com>
Cc: netfilter@lists.netfilter.org

Hello SB,

It is only example don't use it in real setup !!!!!!!
Add your additional rules for filtering !!!!!!!!!!!!!


Creat chain for every user (for optimal setup)
iptables -N user1
iptables -N user2
.........
# For user1
iptables -A user1 -m time --timestart 08:00 --timestop 09:00 --days \
Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT
iptables -A user1 -m time --timestart 09:00 --timestop 10:00 --days \
Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT
.........
iptables -A user1 -m time --timestart 16:00 --timestop 17:00 --days \
Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT

# For user2
iptables -A user2 -m time --timestart 08:00 --timestop 09:00 --days \
Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT
iptables -A user2 -m time --timestart 09:00 --timestop 10:00 --days \
Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT
.........
iptables -A user2 -m time --timestart 16:00 --timestop 17:00 --days \
Mon,Tue,Wed,Thu,Fri -m quota --quota 10485760 -j ACCEPT
.........

Send packets from users to his chain
# FORWARD

# For download limit
iptables -A FORWARD -i $IF1 -d $USER1_IP -j user1
iptables -A FORWARD -i $IF1 -d $USER2_IP -j user2
.........

# For upload limit
iptables -A FORWARD -i $IF1 -s $USER1_IP -j user1
iptables -A FORWARD -i $IF1 -s $USER2_IP -j user2
.........

# You can limit only upload or only download F.E. if you wish.
# Sorry for my pure English :((

-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------


