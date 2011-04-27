From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Using source nat to discriminate traffic
Date: Wed, 27 Apr 2011 11:07:46 +0530
Message-ID: <4DB7ABAA.4070604@atc.tcs.com>
References: <4DB68B40.2030806@gmail.com> <4DB6B471.7000805@atc.tcs.com> <4DB6BDC3.1070306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB6BDC3.1070306@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/26/2011 06:12 PM, carlopmart wrote:
> Thanks Vignesh. Yes, your solution is perfectly and correct. But exists
> a problem: this hosts is included on a cluster (RHCS) with three nodes
> (in three weeks, will be six nodes). Service can run on a hostA, hostB
> or hostC ...

Ok. In that case I don't have any solutions using iptables. I can 
suggest the following two alternatives for your consideration.

1. Is there any application level change that you can make? You told 
already that you won't be able to upgrade mysql client for technical 
reasons. However, if the actual problem exists between the [web] 
services which require DB access and the MySQL server, you can look for 
options which allow us to specify the source IP while making the socket 
connection with MySQL server.

eg., if your website is using PHP to make connections to MySQL server, 
then the following code may help,

On website1,

$sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
socket_bind($sock, '172.21.2.2');
socket_connect($sock, '172.17.3.3', 3306);
//code to access the BBDD_1

On website2,

$sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
socket_bind($sock, '172.21.2.3');
socket_connect($sock, '172.17.3.3', 3306);
//code to access the BBDD_2

The above code snippet is only to give some idea and is neither complete 
nor tested. Similar code must be available for other web technologies too.

ref:
[1] 
<http://stackoverflow.com/questions/4765269/specify-source-ip-using-fsockopen>
[2] Example #1 in <http://in2.php.net/manual/en/function.socket-bind.php>

2. Another option would be using Virtual Machines (VMs). Run the 
services inside different VMs and migrate the VMs instead of services 
across hosts.

ref: 
<http://phparmor.com/php-source-code/how-can-i-bind-to-specific-ip-address-for-outbound-phpmysql-connection-linux/>

Note: Since my suggestions are not related to iptables, our discussion 
seems to be off topic for this list. If you have any other queries, 
please reply to me.

Regards,
Vignesh
