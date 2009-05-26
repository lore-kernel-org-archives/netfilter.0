From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: NAT + (libnfqueue || libipq): There are some documents about it?
Date: Tue, 26 May 2009 01:53:44 -0300
Message-ID: <3fdd6ce00905252153h2b83319q818cc0b1c9a7dfb5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=D9v3yk9FXGuVjZSLrECZ/fmQo2Topdfi2QctiXQ2jQs=;
        b=pgDa1kQMstw0dTodKyl9EQyLzHUnXNLXVaQpEIMCbE/u4TILHuoC9QOImoteI9OCwY
         EbeJ6KMXTXVJPuH6EoJYG+KeAIqXB4dYylQeRsy1x3JIrHWW37z5+/IwRXfZB4EvW6b4
         mFLnxnZaEbPKowhsZxMVLKLnlUHthTlPTiQWM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

Hi all,

I need to do some tasks about translating address in user-space. So, I
first tried using libipq because it seems to me a library present in a
great variety of linux distros. But it was unsuccessful, the changes
done on packets appeared to be simply 'ignored'.

So, now I want to do it with libnfqueue. Before starting a possibly
unsuccessful try, I want to know if is there any documents about it,
and if anybody should give me some idea about it.

Just to get in touch with the reasons the first trying was
unsuccesful, the above code is the one which don't work(please forgive
me by the portuguese strings and comments and ignore it):

/*
* This code is GPL.
*/

#include <sys/types.h>
#include <limits.h>
#include <net/if.h>
#include <netinet/ip.h>
#include <linux/netfilter_ipv4.h>
#include <linux/tcp.h>

#include <linux/netfilter.h>
#include <libipq.h>
#include <stdio.h>
#include <stdlib.h>

#define BUFSIZE 2048
#define DECIMAL_BYTE_VALUE 255


unsigned int inet_addr(char *ip)
{
int a,b,c,d;
sscanf(ip,"%d.%d.%d.%d",&a,&b,&c,&d);
char arr[4];
arr[0]=3Da;arr[1]=3Db;arr[2]=3Dc;arr[3]=3Dd;

return *(unsigned int*)arr;
}


static void die(struct ipq_handle *h)
{
ipq_perror("Erro na libipq: ");
/* destr=F3 socket criado pela ipq_create_handle */
ipq_destroy_handle(h);
exit(1);
}

int main(int argc, char **argv)
{
int status;
unsigned char buf[BUFSIZE];
struct ipq_handle *h;
unsigned char *payload;
int curr_ip =3D 0;
/*
* Cria o sokect de comunicao, para receber
* os pacotes do kernel space
*/
h =3D ipq_create_handle(0, PF_INET);
if (!h)
die(h);

/*
* Configura para receber o payload (pacote completo)
*/
status =3D ipq_set_mode(h, IPQ_COPY_PACKET, BUFSIZE);
if (status < 0)
{
die(h);
}

do{
/*
* Entra em estado de espera por pacotes enviados =E0ila.
* Para cada pacote, faz uma c=F3 da informa=E7, em
* mem=F3 apontada por buf
*/
status =3D ipq_read(h, buf, BUFSIZE, 0);
if (status < 0)
die(h);

/*
* Verifica o tipo da mensagem em fila
*/
switch (ipq_message_type(buf)) {
case NLMSG_ERROR:
/* Opz, algo errado acorreu. */
fprintf(stderr, "Received error message %d\n",
ipq_get_msgerr(buf));
break;

case IPQM_PACKET: {
/*
* Recebemos um pacote.
*/
ipq_packet_msg_t *m =3D ipq_get_packet(buf);
/*
* Como pedimos o payload, vamos pegar o cabe=E7ho
* ip do pacote (que est=E1o in=EDo da estrutura)
* e guardar o endere=E7dele em um ponteiro
* espec=EDco para esse tipo de estrutura.
*/
struct iphdr *iph =3D ((struct iphdr *)m->payload);

if (!iph) {
}
if (curr_ip % argc =3D=3D 0) {
	curr_ip++;
}
printf("Usando IP: %s\n",argv[curr_ip % argc]);
printf("IP Atual: %ld\n", iph->saddr);
iph->saddr =3D inet_addr(argv[curr_ip % argc]);
curr_ip++;
printf("IP Novo: %ld\n", iph->saddr);

status =3D ipq_set_verdict(h, m->packet_id,
NF_ACCEPT, m->data_len, m->payload);
if (status < 0) {
 die(h);
}
break;
}

default:
printf("Defaulting...\n");
break;
}
} while (1); /* loop infinito, enquanto nao der erro, leia pacotes */

/* finaliza a conexao */
ipq_destroy_handle(h);
return 0;
}
