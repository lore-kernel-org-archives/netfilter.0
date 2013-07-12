From: "Nestor A. Diaz" <nestor@tiendalinux.com>
Subject: Re: Clarification on the use of the statistic module
Date: Fri, 12 Jul 2013 11:55:34 -0500
Message-ID: <51E03506.6020107@tiendalinux.com>
References: <51DD79C7.3080707@tiendalinux.com> <51DE7697.3020204@plouf.fr.eu.org> <51DEFE24.8030601@tiendalinux.com> <51DF3CAC.7070507@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51DF3CAC.7070507@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,Thank you very much for the explanation, that makes things more clear
for me now.

> Each occurence of the statistic match has its own individual counter.
>
>> According to your suggestion if i remove the line with the "-j ACCEPT"
>> then the statistic log as I want and in fact it does.
>>
>> However if i jump to a 'DNAT' directly, the problem persist as (50/25)
>> it doesn't work as i have read from some websites
> Of course. Like ACCEPT, DNAT is also a terminal target.
Ok, good to know :)

>> As solution if I want to jump to DNAT directly then i have to decrease
>> the 'every' option as follows which do what i want:
>>
>> # This works:
>> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --every
>> 2 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 -j
>> DNAT --to-destination 192.168.2.20:7101
>> /sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --every
>> 1 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 -j
>> DNAT --to-destination 192.168.2.20:7102
> You realize that "--every 1" does not make any sense and it is much
> simpler to just remove the statistic match in that rule, don't you ?
Yes, but as a personal preference: 'Explicit is better than implicit, no
matter how obvious is'.

I usually make my own bash functions, something like this:

balance tcp eth1 192.168.1.1 7100 0.0.0.0/0 eth0 192.168.2.20 2 7101

which translates to: balance every tcp packet coming from eth1 interface
with destination ip address 192.168.1.1 and port 7100 coming from
0.0.0.0/0 then dnat  via eth0 to 192.168.2.20 ip address and balance
between 2 ports incrementing the port by one starting at 7101.

This is the bash function i use and is now working:

balance() {
    DNAT_PROT=${1}
    DNAT_IN_IFACE=${2}
    DNAT_IN_IP=${3}
    DNAT_IN_PORT=${4}
    DNAT_IN_NET=${5}
    DNAT_OUT_IFACE=${6}
    DNAT_OUT_IP=${7}
    DNAT_OUT_EVERY=${8}
    DNAT_OUT_PORT=${9}

    case $MASQMETHOD in
        netfilter)

            for i in `seq 1 $((${DNAT_OUT_EVERY})) | sort -r`
            do
            balance_port=$((${DNAT_OUT_PORT}+${DNAT_OUT_EVERY}-${i}))
                $IPTABLES -t nat -A prerouting_rule \
                    -m statistic --mode nth --every ${i} --packet 0 \
                    -i ${DNAT_IN_IFACE} -s ${DNAT_IN_NET} -d
${DNAT_IN_IP} -p ${DNAT_PROT} --dport ${DNAT_IN_PORT} \
                    -j DNAT --to-destination ${DNAT_OUT_IP}:${balance_port}
                $IPTABLES -A forwarding_rule -i ${DNAT_IN_IFACE} -o
${DNAT_OUT_IFACE} -s ${DNAT_IN_NET} -d ${DNAT_OUT_IP} -p ${DNAT_PROT}
--dport ${balance_port} -j ACCEPT
                $IPTABLES -A forwarding_rule -i ${DNAT_OUT_IFACE} -o
${DNAT_IN_IFACE} -s ${DNAT_OUT_IP} -d ${DNAT_IN_NET} -p ${DNAT_PROT}
--sport ${balance_port} -j ACCEPT
            done
            ;;
    esac
}


This way i don't have to type the whole iptables pastoril

Even the OpenWRT firewall which is one of the best shell scripts i have
seen for managing iptables always put '-t filter ' no matter if that is
the default.

>> I am experimenting with the behavior and if I jump to custom chain which
>> performs other operations like 'log' statistics keep working as
>> expected. (50/50) however if i put a 'DNAT' rule things become (50/25),
>> it seems DNAT affects the behavior but i don't know why,  Any
>> explanation for this will be appreciated.
> Jumping to a user-defined chain is a good idea if multiple actions are
> associated to the same statistic match (e.g. LOG and DNAT). However it
> won't change the fact that terminal targets such as ACCEPT, DROP,
> REJECT, DNAT... prevent further rules to see the packet, thus change the
> actual ratio of further statistic matches.
>
> If the first statistic match takes 1 over N packets, then the next
> statistic match will see only the remaining packets, i.e. N-1 over N,
> not N. So if you want it to also take 1 over N of all packets, it means
> 1 over N-1 of the remaining packets. And so on. This is why you had to
> decrease the 'every' option. The last rule will take all the remaining
> packets without the need for a statistic match

Slds.

-- 
Typed on my key64.org keyboard

Nestor A Diaz

