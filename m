From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: Problem using "string" support on iptables
Date: Wed, 6 Sep 2006 21:50:28 +0200
Message-ID: <004f01c6d1ed$b471d090$1401a8c0@RUBEN>
References: <20060906135052.taczeo17kgs04ock@mail.col.gob.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060906135052.taczeo17kgs04ock@mail.col.gob.mx>
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

Hi,

> iptables -I FORWARD -p tcp --dport 1863 -m string --string "someuser" -j
> DROP
> 
> And i get this error:
> 
> iptables v1.3.5: STRING match: You must specify `--algo'
> 
> Why i get that problem?

  1st of all, use the string module in the raw table. Then:

  -m string --string "your string" --algo bm

Ruben



