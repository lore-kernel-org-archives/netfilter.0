From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: How to block internet messenger
Date: Tue, 13 May 2003 10:17:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E6D65A6EE5AAD6119DE800B0D03DA0C5289663@MS_LEU1>
References: <000f01c318ee$3c6c9d20$120010ac@sepakat.com.my>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000f01c318ee$3c6c9d20$120010ac@sepakat.com.my>
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

> Can you suggest rules in ipchains that can I use to 
> blocking internet messenger using Yahoo Messenger,
> MSN Messenger and ICQ

From previouw posts ..

Yahoo (thanks to Joel N).
Block these in the FORWARD chain :
63.216.136.22  
66.135.224.142 
66.136.175.132 
66.163.168.105 
66.163.172.117 
66.163.173.76  
66.163.173.77  
66.163.173.78  
66.163.173.203 
66.163.175.128 
66.163.178.78  
204.71.200.36  
204.71.200.37  
204.71.201.134 
204.71.201.141 
216.136.173.172
216.136.173.179
216.136.175.132
216.136.175.142
216.136.175.143
216.136.175.144
216.136.175.145
216.136.175.145
216.136.175.226
216.136.224.134
216.136.224.142
216.136.224.213
216.136.224.213
216.136.224.214
216.136.225.12 
216.136.226.117
216.136.226.118
216.136.226.209
216.136.226.210
216.136.227.168
216.136.233.129
216.136.233.130
216.136.233.131
216.136.233.133
216.136.233.135
216.136.233.148
216.136.233.151
216.136.233.152

MSN (well, it works for *my* MSN Messenger although I'm not sure if it
covers all servers).
Block these in the FORWARD chain :
0.0.0.0:1863/tcp
207.46.104.20:80/tcp
207.46.110.3:80/tcp
217.32.247.3:80/tcp

ICQ, I'm not sure.
Old clients (up to 99 ?) connected using port 4000 and new clients (as
of 2000) use 5190. ICQ logs into login.icq.com which resolves to
multiple servers, to be exact :

;; ANSWER SECTION:
login.icq.com.          209     IN      CNAME
login.login-grt.messaging.aol.com.
login.login-grt.messaging.aol.com. 86 IN A      205.188.153.249
login.login-grt.messaging.aol.com. 86 IN A      205.188.179.233
login.login-grt.messaging.aol.com. 86 IN A      64.12.161.153
login.login-grt.messaging.aol.com. 86 IN A      64.12.161.185
login.login-grt.messaging.aol.com. 86 IN A      64.12.200.89

I think it's enough to block these in the FORWARD chain :
4000/tcp
5190/tcp
Of course you can also add the above IP's to the rules.


Gr,
Rob


