From: "Paolo Malfatti" <paolo@cidis.ws>
Subject: tc show rate over ceil value
Date: Fri, 4 Aug 2017 09:41:26 -0400
Message-ID: <3c7301d30d27$5ec08fc0$1c41af40$@cidis.ws>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
References: 
In-Reply-To: 
Content-Language: es
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi everybody. 
 
I upgraded my kernel from 4.3 to 4.11 and i’m seeing weird values doing “tc show” commands: 
 
tc -s -d class show dev eth0 classid 1:1385
class htb 1:1385 parent 1:405 leaf 1385: prio 6 quantum 42625 rate 341Kbit ceil 4096Kbit linklayer ethernet burst 13Kb/1 mpu 0b cburst 8Kb/1 mpu 0b level 0
Sent 139507848 bytes 92285 pkt (dropped 0, overlimits 0 requeues 0)
rate 7256Kbit 599pps backlog 0b 0p requeues 0
lended: 8835 borrowed: 42779 giants: 0
tokens: -232736 ctokens: 19103

I’m using debian testing with iproute2 4.9.0-1 and rate estimator in my script: 
 
echo 1 > /sys/module/sch_htb/parameters/htb_rate_est
 
Booting back with 4.3 kernel resolve the issue and the traffic is shaped like usual. 
 
Any idea?
 
Best regards
Paolo Malfatti
CIDIS Camiri
 
 


