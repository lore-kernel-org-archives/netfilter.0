From: meillnco <nmeillet@wanadoo.fr>
Subject: rtsp-conntrack help needed...
Date: Sat, 17 Jan 2004 11:21:05 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20570477.1074334865111.JavaMail.www@wwinf0601>
Reply-To: nmeillet@wanadoo.fr
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

Hello all,

This is my first post on this list but I've known netfilter for a while now... I'm just about to start using it though.

Here is my question / problem : I have a generic configuration LAN <=> FIREWALL <=> INTERNET. My goal is to be able to play a video streamed by a public server. However, for the moment, my local clients can't stream as all RTP packets are stopped by the firewall. Here comes (maybe ?) rtsp-conntrack...

I was wondering if anyone had already (and successfully) installed this patch ? I've been facing this problem for soooo long, any help would be much appreciated. Especially regarding installation / compliation tips and examples of the rules to add in my firewall configuration file.

Thanks again for any help !
Nico

PS : sorry if this message is inaccurate, I'm not so deep into Linux... 

