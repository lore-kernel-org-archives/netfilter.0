From: "Julio A. Romero" <julioarr@fisica.uh.cu>
Subject: about connlimit + fuzzy in same rule
Date: Fri, 12 Aug 2011 22:59:04 -0400
Message-ID: <C820C52CFA37468F819FF4DFCFDDC10F@poweredge1800>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi all,



Does it have some meaning the following rule?



iptables -A average -m connlimit --connlimit-above 10 -m fuzzy --lower-limit 
100 --upper-limit 1000 -j REJECT



thanks,

julio

