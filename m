From: "Sohail Ahmed Siddiqui" <sohail@uni-duisburg.de>
Subject: problem with samba
Date: Sat, 26 Jul 2003 22:07:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c353b1$8fa0c220$4fef5b86@stw.uniduisburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi all,
i am new to iptables and i have a problem, i will be very greatful i fsome
one helps me out.
at my place i have a lan with 192.168.0.0/24 and in the building we have
134.91.239.0. i have managed to firewall my local net and access the
internet with iptables but i want to share some files via samba. but my
samba connection is not going out. i am using

iptables -A FORWARD -j lan -p tcp --dport 137:139
iptables -A FORWARD -j lan -p udp --dport 137:139

but this some how doesnt seem to work.
i have searched the internet but some how i didnt find any thing which can
solve my problem. any help is welcome
regards
Sohail Ahmed Siddiqui


