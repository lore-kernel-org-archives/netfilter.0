From: shardul Adhikari <free2squid@gmail.com>
Subject: iptables question
Date: Thu, 10 Feb 2005 20:34:44 +0530
Message-ID: <6c2d1c9d0502100704411edabb@mail.gmail.com>
Reply-To: shardul Adhikari <free2squid@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi all,
This is my first post, hope i make my self clear,
I have two locations 
location a and b , both are having independent internet connectivity ,
and there is a interconnectivity between location a and b,
i have squid proxy server at both the locations. Now if the internet
connectivity is down at location a then i can put the iptables rule to
redirect http traffic to location b proxy server and vice versa ,
What i want is to automate this process . if any body of you has come
across any program or script , which checks the conectivity of
respective location  and accordingly put iptables entry  and remove it
if the connectivity comes back.

Thanks in advance

