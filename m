From: Paul Chavent <paul.chavent@free.fr>
Subject: Options for a custom chain/target
Date: Tue, 12 Mar 2013 22:08:18 +0100
Message-ID: <513F9942.1040709@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi

I would like to be able to pass options to a custom chain. For instance :

$IPT -N log_and_drop

$IPT -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j log_and_drop --set-custom-arg "New not syn: "

$IPT -A log_and_drop -j LOG --log-prefix --get-custom-arg
$IPT -A log_and_drop -j DROP


Is there any way to do that ? I thought that it could also be achieved with kind of templates in the shell script that init the rules...

Thanks for your assistance.

Regards.

Paul.

P.S. could you cc me, since i haven't subscribed to the list ?
